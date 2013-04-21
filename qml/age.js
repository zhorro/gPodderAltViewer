function fromNow(dateStr)
{
    var now = Date.now();
    var date = Date.parse(dateStr);
    var ms  = now-date;

    var s = Math.floor(ms/1000);
    var m = Math.floor(s/60);
    var h = Math.floor(m/60);
    var d = Math.floor(h/24);
    var w = Math.floor(d/7);
    var M = Math.floor(d/31);
    var Y = Math.floor(d/365);

    if (Y > 0)
        return Y + " " + qsTr(" years");

    if (M > 0)
        return M + " " + qsTr("monthes");

    if (w > 0)
        return w + " " + qsTr("weeks");

    if (d > 0)
        return d + " " + qsTr("days");

    if (h > 0)
        return h + " " + qsTr("hours");

    if (m > 0)
        return m + " " + qsTr("minutes");

    return s + " " + qsTr("seconds");
}
