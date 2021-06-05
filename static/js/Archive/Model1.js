
// build caller function that calls all the pieces (charts)
function optionChanged(Airline) {  
    console.log(Airline)
  }
  
//load drop down list

d3.json("AirlineDropDown").then((data) =>{ 
    console.log('Building Airline Dropdown')
    console.log(data)

    var DropDownAirline =data;

    // console.log(names1)

    var dropdown = d3.select("#selDataset");


    //loop through names and add to dropdown
    DropDownAirline.forEach((item) => 
    {
        //append dropdown
        dropdown.append("option").text(item);
    });

    optionChanged("Alaska Airlines, Inc.")

});


var button = d3.select("#filter-btn");

button.on("click", runEnter);

function runEnter() {
    console.log("in runenter");
  
    // Prevent the page from refreshing
    // d3.event.preventDefault();

  // Select the input element and get the raw HTML node
  var inputElementAirline = d3.select("#selDataset");
  var inputElementOriginAirport = d3.select("#OriginAirport");
  var inputElementDestinationAirport = d3.select("#DestinationAirport");

  // Get the value property of the input element
  var inputValueAirline = inputElementAirline.property("value");
  var inputValueOriginAirport = inputElementOriginAirport.property("value");
  var inputValueDestinationAirport = inputElementDestinationAirport.property("value");

  console.log('airline selected in form='+inputValueAirline)
  console.log('OriginAirport selected in form='+inputValueOriginAirport)
  console.log('DestAirport selected in form='+inputValueDestinationAirport)

  var Route = "/Predict/"+inputValueAirline+"/"+inputValueOriginAirport+"/"+inputValueDestinationAirport
  console.log('Route='+Route)


  d3.json(Route).then((importedData) => {
    console.log(importedData)

    ParseData = importedData 
    // JSON.parse(importedData)

    console.log(ParseData)

    ParseData.forEach(function (ParseData) {
      console.log(ParseData);
      var row = tbody.append("tr");
      Object.entries(ParseData).forEach(function ([key, value]) {
        var cell = row.append("td");
        cell.text(value);
      });
    });

  });





}