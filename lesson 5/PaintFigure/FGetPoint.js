function getPoint(figureidx, canvaswidth, canvasheight, divider) {

var pArr = [];
var step_division = divider;
var r = Number(canvasheight) / step_division;
var R = Number(canvaswidth) / step_division;

    switch(figureidx){
        case 0://звезда
            var deg = Math.PI * 72 / 180;

            pArr = [[r, 0],
                    [r * Math.cos(2 * deg), -r * Math.sin(2 * deg)],
                    [r * Math.cos(4 * deg), -r * Math.sin(4 * deg)],
                    [r * Math.cos(deg), -r * Math.sin(deg)],
                    [r * Math.cos(3 * deg), -r * Math.sin(3 * deg)]];
        break;

        case 1: //кольцо
            var x = r * Math.cos(0);
            var y = r * Math.sin(0);

            pArr.push([x, y]);

            for (var n = 0; n < 360; n++)
            {
                x = r * Math.cos((n * Math.PI) / 180);
                y = r * Math.sin((n * Math.PI) / 180);
                pArr.push([x, y]);
            }
        break;

        case 2: //дом

            pArr.push([R, 0]);
            pArr.push([0, -r]);
            pArr.push([-R, 0]);
            pArr.push([R, 0]);
            pArr.push([R, r]);
            pArr.push([-R, r]);
            pArr.push([-R, 0]);
        break;

        case 3: //часы

            pArr.push([0, 0]);
            pArr.push([R, -r]);
            pArr.push([-R, -r]);
            pArr.push([R, r]);
            pArr.push([-R, r]);
        break;
    }

    return pArr;
}
