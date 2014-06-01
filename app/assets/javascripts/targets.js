var buildPieChart = function(){
  jQuery.ajax({
    dataType: 'json',
    url: 'http://0.0.0.0:3000/targets/reachable'
  }).done(function(response) {
    var data = [];
    var reachable = 0;
    var unreachable = 0;
    _.each(response, function(value,key) {
      if(value){
        reachable = reachable + 1;
      }
      else {
        unreachable = unreachable + 1;
      }
    });
    var data = [
      {
        value: unreachable,
        color: '#246E6E',
        label: 'UnReachable',
        labelColor : 'white',
        labelFontSize : '16',
        labelAlign: 'center'
      },
      {
        value: reachable,
        color: '#5DA4A4',
        label: 'Reachable',
        labelColor : 'white',
        labelFontSize : '16',
        labelAlign: 'center'
      }
    ];
    var options = { };
    var myPie = new Chart(document.getElementById("myChart").getContext("2d")).Pie(data);
  }).fail(function(response) {
    jQuery('#myChart').html('Chart data failed to load. :(');
    console.log(response);
  });
};

