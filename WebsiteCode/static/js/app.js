// // from data.js
// var tableData = data;

// // YOUR CODE HERE!
// // select tbody using ds
// tbody = d3.select("tbody")

// // using Object.entries to get into key and value pairs of data inside of the table
// // and loop through them to add to the table in html
// function displayData(data){ 
//     tbody.text("")
//     data.forEach(function(sighting){
//     new_tr = tbody.append("tr")
//     Object.entries(sighting).forEach(function([key, value]){
//         new_td = new_tr.append("td").text(value)	
//     })
// })}

// displayData(tableData)

// var inputText = d3.select("#datetime")
// var button = d3.select("filter-btn")

// // filter data with desired date
// function changeHandler(){
//     d3.event.preventDefault();
//     console.log(inputText.property("value"));
//     var new_table = tableData.filter(sighting => sighting.datetime===inputText.property("value"))
//     displayData(new_table)
// }

// // event listener to handle change and click
// inputText.on("change", changeHandler)
// button.on("click", changeHandler)