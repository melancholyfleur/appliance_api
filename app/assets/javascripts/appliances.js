var buildTargetsSpreadChart = function() {
  jQuery.ajax({
    dataType: 'json',
    url: 'http://0.0.0.0:3000/appliances/all_appliances'
  }).done(function(response) {
    var data = [];
    var ship_names = [];
    var target_counts = [];
    _.each(response, function(value,key) {
      ship_names.push(key);
      target_counts.push(value);
    });
    data = {
      labels : ship_names,
      datasets : [
        {
          fillColor : "rgba(36, 110, 110, 1)",
          strokeColor : "rgba(36, 110, 110, 1)",
          data : target_counts
        }
      ]
    }

    var options = { scaleLineColor : "rgba(231, 231, 118, 1)", scaleGridLineColor : "rgba(231, 231, 118, 1)", scaleFontColor : "#E7A976", scaleFontSize : 16 };
    var myPie = new Chart(document.getElementById("targetspership").getContext("2d")).Bar(data,options);
  }).fail(function(response) {
    console.log(response);
  });
};
