document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById('mycanvas');
    canvas.style.height = 500;
    canvas.style.width = 500;
    let ctx = canvas.getContext('2d');

    // drawing a rectangle
    ctx.fillStyle = "red";
    ctx.fillRect(0,0, 100, 200);

    // drawing a circle
    ctx.beginPath();
    ctx.arc(30, 30, 20, 0, 360, false);
    ctx.strokeStyle = "blue";
    ctx.lineWidth = 2; // thickness of circle
    ctx.stroke(); // this draws the circle
    ctx.fillStyle = "green"; // color of the inner circle
    ctx.fill(); // fills the inner circle with select color
});