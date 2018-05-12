<!DOCTYPE HTML>
<html>
    <head>
        <script>
            window.onload = function () {

        //Better to construct options first and then pass it as a parameter
                var options = {
                    title: {
                        text: "Column Chart in jQuery CanvasJS"
                    },
                    data: [
                        {
                            // Change type to "doughnut", "line", "splineArea", etc.
                            type: "column",
                            dataPoints: [
                                {label: "apple", y: 10},
                                {label: "orange", y: 15},
                                {label: "banana", y: 25},
                                {label: "mango", y: 30},
                                {label: "grape", y: 28}
                            ]
                        }
                    ]
                };
                
                var options2 = {
                    title: {
                        text: "Column Chart in jQuery CanvasJS"
                    },
                    data: [
                        {
                            // Change type to "doughnut", "line", "splineArea", etc.
                            type: "column",
                            dataPoints: [
                                {label: "apple", y: 10},
                                {label: "orange", y: 15},
                                {label: "banana", y: 25},
                                {label: "mango", y: 30},
                                {label: "grape", y: 28}
                            ]
                        }
                    ]
                };


                $("#chartContainer").CanvasJSChart(options);
                
                $("#chartContainer2").CanvasJSChart(options2);
            }
        </script>
    </head>
    <body>
        <div id="chartContainer" style="height: 300px; width: 100%;"></div>
        <div id="chartContainer2" style="height: 300px; width: 100%;"></div>
        <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
    </body>
</html>