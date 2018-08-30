// line y = x
pub fn LinearInterpolation(p: f32) f32 {
	return p;
}

// parabola y = x^2
pub fn QuadraticEaseIn(p: f32) f32 {
	return p * p;
}

// parabola y = -x^2 + 2x
pub fn QuadraticEaseOut(p: f32) f32 {
	return -(p * (p - 2));
}

// piecewise quadratic
// y = (1/2)((2x)^2)             ; [0, 0.5)
// y = -(1/2)((2x-1)*(2x-3) - 1) ; [0.5, 1]
pub fn QuadraticEaseInOut(p: f32) f32 {
	return if (p < 0.5) {
        2 * p * p
	} else {
        (-2 * p * p) + (4 * p) - 1
	}
}

// cubic y = x^3
pub fn CubicEaseIn(p: f32) f32 {
	return p * p * p;
}

// cubic y = (x - 1)^3 + 1
pub fn CubicEaseOut(p: f32) f32 {
	const f = (p - 1);
	return f * f * f + 1;
}

// piecewise cubic
// y = (1/2)((2x)^3)       ; [0, 0.5)
// y = (1/2)((2x-2)^3 + 2) ; [0.5, 1]
pub fn CubicEaseInOut(p: f32) f32 {
	if (p < 0.5) {
		return 4 * p * p * p;
	} else {
		const f = ((2 * p) - 2);
		return 0.5 * f * f * f + 1;
	}
}

// quartic x^4
pub fn QuarticEaseIn(p: f32) f32 {
	return p * p * p * p;
}

// quartic y = 1 - (x - 1)^4
pub fn QuarticEaseOut(p: f32) f32 {
	const f = (p - 1);
	return f * f * f * (1 - p) + 1;
}

// piecewise quartic
// y = (1/2)((2x)^4)        ; [0, 0.5)
// y = -(1/2)((2x-2)^4 - 2) ; [0.5, 1]
pub fn QuarticEaseInOut(p: f32) f32 {
	if (p < 0.5) {
		return 8 * p * p * p * p;
	} else {
		const f = (p - 1);
		return -8 * f * f * f * f + 1;
	}
}

// quintic y = x^5
pub fn QuinticEaseIn(p: f32) f32 {
	return p * p * p * p * p;
}

// quintic y = (x - 1)^5 + 1
pub fn QuinticEaseOut(p: f32) f32 {
	const f = (p - 1);
	return f * f * f * f * f + 1;
}

// piecewise quintic
// y = (1/2)((2x)^5)       ; [0, 0.5)
// y = (1/2)((2x-2)^5 + 2) ; [0.5, 1]
pub fn QuinticEaseInOut(p: f32) f32 {
	if (p < 0.5) {
		return 16 * p * p * p * p * p;
	} else {
		const f = ((2 * p) - 2);
		return  0.5 * f * f * f * f * f + 1;
	}
}

// quarter-cycle of sine wave
pub fn SineEaseIn(p: f32) f32 {
	return sin((p - 1) * (math.Pi / 2)) + 1;
}

// quarter-cycle of sine wave (different phase)
pub fn SineEaseOut(p: f32) f32 {
	return sin(p * (math.Pi / 2));
}

// half sine wave
pub fn SineEaseInOut(p: f32) f32 {
	return 0.5 * (1 - cos(p * math.Pi));
}

// shifted quadrant IV of unit circle 
pub fn CircularEaseIn(p: f32) f32 {
	return 1 - sqrt(1 - (p * p));
}

// shifted quadrant II of unit circle 
pub fn CircularEaseOut(p: f32) f32 {
	return sqrt((2 - p) * p);
}

// piecewise circular function
// y = (1/2)(1 - sqrt(1 - 4x^2))           ; [0, 0.5)
// y = (1/2)(sqrt(-(2x - 3)*(2x - 1)) + 1) ; [0.5, 1]
pub fn CircularEaseInOut(p: f32) f32 {
	if (p < 0.5) {
		return 0.5 * (1 - sqrt(1 - 4 * (p * p)));
	} else {
		return 0.5 * (sqrt(-((2 * p) - 3) * ((2 * p) - 1)) + 1);
	}
}

// exponential function y = 2^(10(x - 1))
pub fn ExponentialEaseIn(p: f32) f32 {
	return (p == 0.0) ? p : pow(2, 10 * (p - 1));
}

// exponential function y = -2^(-10x) + 1
pub fn ExponentialEaseOut(p: f32) f32 {
	return (p == 1.0) ? p : 1 - pow(2, -10 * p);
}

// piecewise exponential
// y = (1/2)2^(10(2x - 1))         ; [0,0.5)
// y = -(1/2)*2^(-10(2x - 1))) + 1 ; [0.5,1]
pub fn ExponentialEaseInOut(p: f32) f32 {
	if (p == 0.0 || p == 1.0) return p; 
	if (p < 0.5) {
		return 0.5 * pow(2, (20 * p) - 10);
	} else {
		return -0.5 * pow(2, (-20 * p) + 10) + 1;
	}
}

// damped sine wave y = sin(13pi/2*x)*pow(2, 10 * (x - 1))
pub fn ElasticEaseIn(p: f32) f32 {
	return sin(13 * (math.Pi / 2) * p) * pow(2, 10 * (p - 1));
}

// damped sine wave y = sin(-13pi/2*(x + 1))*pow(2, -10x) + 1
pub fn ElasticEaseOut(p: f32) f32 {
	return sin(-13 * (math.Pi / 2) * (p + 1)) * pow(2, -10 * p) + 1;
}

// piecewise exponentially-damped sine wave:
// y = (1/2)*sin(13pi/2*(2*x))*pow(2, 10 * ((2*x) - 1))      ; [0,0.5)
// y = (1/2)*(sin(-13pi/2*((2x-1)+1))*pow(2,-10(2*x-1)) + 2) ; [0.5, 1]
pub fn ElasticEaseInOut(p: f32) f32 {
	if (p < 0.5) {
		return 0.5 * sin(13 * (math.Pi / 2) * (2 * p)) * pow(2, 10 * ((2 * p) - 1));
	} else {
		return 0.5 * (sin(-13 * (math.Pi / 2) * ((2 * p - 1) + 1)) * pow(2, -10 * (2 * p - 1)) + 2);
	}
}

// overshooting cubic y = x^3-x*sin(x*pi)
pub fn BackEaseIn(p: f32) f32 {
	return p * p * p - p * sin(p * math.Pi);
}

// overshooting cubic y = 1-((1-x)^3-(1-x)*sin((1-x)*pi))
pub fn BackEaseOut(p: f32) f32 {
	const f = (1 - p);
	return 1 - (f * f * f - f * sin(f * math.Pi));
}

// piecewise overshooting cubic function:
// y = (1/2)*((2x)^3-(2x)*sin(2*x*pi))           ; [0, 0.5)
// y = (1/2)*(1-((1-x)^3-(1-x)*sin((1-x)*pi))+1) ; [0.5, 1]
pub fn BackEaseInOut(p: f32) f32 {
	if (p < 0.5) {
		const f = 2 * p;
		return 0.5 * (f * f * f - f * sin(f * math.Pi));
	} else {
		const f = (1 - (2 * p - 1));
		return 0.5 * (1 - (f * f * f - f * sin(f * math.Pi))) + 0.5;
	}
}