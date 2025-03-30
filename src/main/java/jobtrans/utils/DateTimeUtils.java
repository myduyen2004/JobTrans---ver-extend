package jobtrans.utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class DateTimeUtils {

    public DateTimeUtils() {
    }
    public LocalDateTime getDateTimeNow(){
        LocalDateTime currentDateTime = LocalDateTime.now();
        return currentDateTime;
    }

    public String formatDateTime(LocalDateTime currentDateTime){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = currentDateTime.format(formatter);
        return formattedDateTime;
    }
    public long countdownDays(Date dueDate) {
        Date currentDate = new Date(); // Lấy ngày hiện tại
        long diffInMillies = dueDate.getTime() - currentDate.getTime();
        return TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
    }

}