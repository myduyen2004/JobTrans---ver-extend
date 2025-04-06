package jobtrans.exception;

public class NoRandomCommandException extends RuntimeException {

    public NoRandomCommandException() {
        super("There is no command random. Try using simpleRandString(length) function.");
    }
}