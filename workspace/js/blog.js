(function() {
    'use strict';

    if (!'addEventListener' in document) {
        return;
    }

    var utility = (function() {
        var transition = function() {
            var test, transitionEvent;
            test = document.createElement('div');

            if ('transition' in test.style) {
                // Firefox
                transitionEvent = 'transitionend';
            } else if('onwebkittransitionend' in window) {
                // Chrome/Saf (+ Mobile Saf)/Android
                transitionEvent = 'webkitTransitionEnd';
            } else if('onotransitionend' in test || navigator.appName == 'Opera') {
                // Opera
                // As of Opera 10.61, there is no "onotransitionend" property added to DOM elements,
                // so it will always use the navigator.appName fallback
                transitionEvent = 'oTransitionEnd';
            } else {
                // IE - not implemented (even in IE9) :(
                transitionEvent = false;
            }

            return transitionEvent;
        };
        
        var pointer = 'ontouchend' in document ? 'touchend' : 'click';

        return {
            transition: transition,
            pointer: pointer
        };
    })();

    var svg = document.getElementsByClassName('button')[0],
    	social = document.getElementsByClassName('social')[0];

    var open = function() {
        social.className += ' is-open';
        setTimeout(function() {
            social.style.height = document.getElementsByClassName('social-inner')[0].clientHeight + 16 + 'px';
        }, 50);
        svg.className = 'links button animated';
        svg.removeEventListener(utility.pointer, open, false);
        svg.addEventListener(utility.pointer, close, false);
    };

    var close = function() {
        var scroll = function() {
            svg.className = 'links button';
            social.style.height = 0;
            svg.addEventListener(utility.pointer, open, false);
            social.removeEventListener(utility.transition(), scroll, false);
        };

        social.addEventListener(utility.transition(), scroll, false);
        svg.removeEventListener(utility.pointer, close, false);
        social.style.height = parseInt(social.style.height, 10) + 32 + 'px';
    };

    svg.addEventListener(utility.pointer, open, false);
    
})();