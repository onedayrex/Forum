/**
 * Created by Administrator on 2016/4/6.
 */
function getLocalTime(nS) {
    var time = new Date(nS);
    //由于这里getYear是获取的是1970年以后的时间，所以要用getFullYear
    //这里的获取月，由于JS中月是从0开始的，所以要加上一
    return time.getFullYear()+"-"+(time.getMonth()+1)+"-"+time.getDate();

}