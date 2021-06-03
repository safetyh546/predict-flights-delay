
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
  var inputElementTime = d3.select("#DepartureTime");

  // Get the value property of the input element
  var inputValueAirline = inputElementAirline.property("value");
  var inputValueTime = inputElementTime.property("value");

  console.log('airline selected in form='+inputValueAirline)
  console.log('time selected in form='+inputValueTime)


}
