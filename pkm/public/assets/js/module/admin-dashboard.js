var AdminDashboard = (function(){

	function init(){
		getAnalytics();
	}

	getAnalytics = function(){
       $.getJSON("getAnalytics",function(data){
            console.log(data);
            if (data) {
                average = data[data.length-1];
                $('.page-views').text(average.pageviews);
                hidePageViewsLoading();
                $('.unique-page-views').text(average.uniquePageviews);
                hideUniquePageViewsLoading();
                $('.average-time-on-page').text(minTommss(average.avgTimeOnPage/60));
                hideAverageTimeLoading();
                $('.entrance-bounce-rate').text(roundToTwo(average.entranceBounceRate)+' %');
                hideBounceRateLoading();
                $('.exit-rate').text(roundToTwo(average.exitRate)+' %');
                hideExitRateLoading();
                //get graph data
                var xAxisLabels = new Array(),
                      dPageviews = new Array(),
                      dVisits = new Array();
                  $.each(data, function(i,v)
                  {
                       xAxisLabels.push(v["day"]+'/'+v["month"]+'/'+v["year"]);
                       dPageviews.push(v.pageViews);
                       dVisits.push(v.visits);
                  });
                console.log(dPageviews);
                console.log(dVisits);
                var chart = new Highcharts.Chart({
                        chart: {
                            renderTo: 'graph',
                            type: 'line',
                            marginRight: 0,
                            marginBottom: 100
                        },
                        title: {
                            text: '',
                            x: -20 //center
                        },
    //                     subtitle: {
    //                         text: 'Source: Google Analytics API',
    //                         x: -20
    //                     },
                        xAxis: {
                            categories: xAxisLabels,
                            labels: {
                                rotation: -90,
                                align: 'right',
                                style: {
                                    fontSize: '11px',
                                    fontFamily: 'Verdana, sans-serif'
                                }
                            }
                        },
                        yAxis: {
                            title: {
                                text: 'Pageviews'
                            }
                        },
                        tooltip: {
                            formatter: function() {
                                    return '<b>'+ this.series.name +'</b><br/>'+
                                    this.x +': '+ this.y.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") +' pageviews';
                            }
                        },
                        legend: {
                            layout: 'horizontal',
                            align: 'center',
                            verticalAlign: 'bottom',
                            x: -10,
                            y: 200,
                            borderWidth: 0
                        },
                        series: [
                        {
                            name: 'pageviews',
                            data: dPageviews
                        },
                        {
                            name: 'visits',
                            data: dVisits
                        }]
                    });
                    hideAnalyticsLoading();
            };

       }); 
    } // end of getAnalytics()

    hideAnalyticsLoading = function(){
        $('.analytics-loading').hide();
    }

    hidePageViewsLoading = function(){
        $('.page-views-loading').hide();
    }

    hideUniquePageViewsLoading = function(){
        $('.unique-page-views-loading').hide();
    }

    hideAverageTimeLoading = function(){
        $('.average-time-loading').hide();
    }

    hideBounceRateLoading = function(){
        $('.bounce-rate-loading').hide();
    }

    hideExitRateLoading = function(){
        $('.exit-rate-loading').hide();
    }

    function roundToTwo(num) {    
        return +(Math.round(num + "e+2")  + "e-2");
    }

    function minTommss(minutes){
        var sign = minutes < 0 ? "-" : "";
        var min = Math.floor(Math.abs(minutes))
        var sec = Math.floor((Math.abs(minutes) * 60) % 60);
        return sign + (min < 10 ? "0" : "") + min + ":" + (sec < 10 ? "0" : "") + sec;
    }

    return {
        init: function(){
            init();
        },
    }
})();