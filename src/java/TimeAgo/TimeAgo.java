/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TimeAgo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import static java.util.concurrent.TimeUnit.DAYS;
import static java.util.concurrent.TimeUnit.HOURS;
import static java.util.concurrent.TimeUnit.MINUTES;

/**
 *
 * @author saiab
 */
public class TimeAgo {

 private static String[] outputStr = new String[]{"year", "month", "week", "day", "hour", "minute"};
 private static long[] minisArray = new long[]{
  DAYS.toMillis(365),
  DAYS.toMillis(30),
  DAYS.toMillis(7),
  DAYS.toMillis(1),
  HOURS.toMillis(1),
  MINUTES.toMillis(1)
 };

 public static String getRelativeTime(final long date) {
  long duration = System.currentTimeMillis() - date;
  StringBuilder sb = new StringBuilder();
  for (int i = 0; i < minisArray.length - 1; i++) {
   long temp = duration / minisArray[i];
   if (temp > 0) {
    sb.append(temp)
            .append(" ")
            .append(outputStr[i])
            .append(temp > 1 ? "s" : "")
            .append(" ago");
    break;
   }
  }
  return sb.toString().isEmpty() ? "just now" : sb.toString();
 }

 public static String getTimeAgo(String date) throws ParseException {
  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  Date start = simpleDateFormat.parse(date);
  return getRelativeTime(start.getTime());
 }
}
