package de.emdete.roberta;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import de.fhg.iais.roberta.connection.IRobot;
import de.fhg.iais.roberta.connection.IConnector;
import de.fhg.iais.roberta.connection.wired.arduino.Arduino;
import de.fhg.iais.roberta.connection.IDetector;
import de.fhg.iais.roberta.connection.wired.WiredRobotType;
import de.fhg.iais.roberta.connection.IConnector.State;
import de.fhg.iais.roberta.connection.SerialLoggingTask;

class Main {
	static final Logger LOG = LoggerFactory.getLogger(Main.class);
	static IConnector<?> connector = null;
	static final ExecutorService executorService = Executors.newSingleThreadExecutor();
	static Future<Void> serialLoggingFuture = null;
	static String serialPort = null;

	static public void setState(State state) {
		switch ( state ) {
			case WAIT_FOR_CONNECT_BUTTON_PRESS: // ready to connect
				connector.connect();
			break;
			case WAIT_FOR_SERVER: // token available
				LOG.info("Connected, robot.name=" + connector.getRobot().getName() + ", token=" + connector.getToken());
			break;
			case WAIT_FOR_CMD: // the token was succesfully used, we are connected, start serial monitor
				if (serialPort != null)
					try {
						serialLoggingFuture = executorService.submit(new SerialLoggingTask(Main::appendSerial, Main.serialPort, 9600));
					}
					catch (Exception e) {
						LOG.info("No arduino found");
					}
			break;
			case WAIT_UPLOAD: // arduino is beeing flashed, stop serial monitor
				if (serialLoggingFuture != null)
					serialLoggingFuture.cancel(true);
			break;
			case ERROR_HTTP: // any unknown error with the server
				LOG.error("http error");
				System.exit(-1);
			break;
			default: // unknown state (there is no doc)
				LOG.info("State is {}", state);
		}
	}

	static void appendSerial(byte[] readBuffer) {
		String[] lines = new String(readBuffer).split("\n");
		for (String line: lines) {
			line = line.strip();
			if (line.length() > 0)
				LOG.info("From serial: '{}'", line);
		}
	}

	public static void main(String args[]) throws Exception {
		try {
			serialPort = args[2];
			connector = new Arduino(WiredRobotType.fromString(args[1]), serialPort).createConnector(); // TODO support all other types
			connector.updateCustomServerAddress(args[0]);
			connector.registerListener(Main::setState);
			connector.fire(State.DISCOVER); // kick off flow
			connector.run();
		}
		finally {
			if (connector != null)
				connector.close();
		}
	}
}
