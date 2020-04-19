SELECT formatDateTime(arrayJoin(arrayMap(x -> now() - (x * 60 * 60), range(7 * 24))), '%F %H:%M') AS hour;
