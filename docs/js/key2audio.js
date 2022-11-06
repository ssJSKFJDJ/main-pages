
var audio = document.getElementById('audio');
audio.play();
document.body.onkeyup = function(e){  //亦可绑定到audio，当鼠标点击到audio之后再按键可触发
    var event = e || window.event;
    console.log('keyCode : ' + event.keyCode);
    console.log('volume : ' + audio.volume);
    if(!arguments.callee.pause){
        arguments.callee.pause = false;
    }
    if(event.keyCode == 40){  //下
        try {
            audio.volume -= 0.1;
        }catch(e){
            console.log('audio.volume is already the smallest : ' + audio.volume);
        }
    }else if(event.keyCode == 38){  //上
        try {
            audio.volume += 0.1;
        }catch(e){
            console.log('audio.volume is already the largest : ' + audio.volume);
        }
    }else if(event.keyCode == 39){  //右
        audio.currentTime += 10;
    }else if(event.keyCode == 37){  //左
        audio.currentTime -= 10;
    }else if(event.keyCode == 32){
        if(!arguments.callee.pause){
            arguments.callee.pause = true;
            audio.pause();
        }else{
            arguments.callee.pause = false;
            audio.play();
        }
    }
    console.log('currentTime : ' + audio.currentTime);
};