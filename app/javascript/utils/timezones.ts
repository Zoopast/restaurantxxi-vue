import { zonedTimeToUtc, formatInTimeZone, utcToZonedTime } from 'date-fns-tz';
import es from 'date-fns/locale/es';

declare interface Params {
  date: string | Date;
  timezone?: string;
  pattern?: string;
}

function getTimezone() {
  const intlFormatter = Intl.DateTimeFormat;
  const timezone = intlFormatter().resolvedOptions().timeZone;

  return timezone;
}

function zonedTimeToUtcString({ date, timezone = getTimezone() }: Params) {
  return zonedTimeToUtc(date, timezone).toUTCString();
}

function formatTime({ date, timezone = getTimezone(), pattern = 'hh:mm a' }: Params) {
  const dateToFormat = utcToZonedTime(date, timezone);

  return formatInTimeZone(dateToFormat, timezone, pattern);
}

function getAMPM({ date, timezone = getTimezone() }: Params) {
  return formatTime({ date, timezone, pattern: 'a' });
}

function formatDate({ date, timezone = getTimezone(), pattern = 'dd MMMM' }: Params) {
  const dateToFormat = utcToZonedTime(date, timezone);

  return formatInTimeZone(dateToFormat, timezone, pattern, { locale: es });
}

function formatDayOfWeek({ date, timezone = getTimezone() }: Params) {
  const dateToFormat = utcToZonedTime(date, timezone);

  return formatInTimeZone(dateToFormat, timezone, 'EEEE', { locale: es });
}

export { zonedTimeToUtcString, getTimezone, formatTime, formatDate, formatDayOfWeek, getAMPM };