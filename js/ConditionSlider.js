/**
 * Slider with human readable description for each state.
 */
function ConditionSlider(element) {
	const slider = element.querySelector("input[type='range']");
	const conditions = this.conditions;

	function updateSlider() {
		this.nextElementSibling.innerHTML = conditions[this.value];
	}

	for (const event of ['change', 'mousemove']) {
		slider.addEventListener(event, updateSlider);
	}

	slider.setAttribute('max', conditions.length - 1);
	slider.setAttribute('min', 0);
	slider.value = Math.round((conditions.length - 1) / 2);

	// Update slider immediately
	updateSlider.call(slider);
}

/**
 * Possible slider values
 */
ConditionSlider.prototype.conditions = [
	'Ødelagt',
	'Veldig slitt',
	'Litt slitt',
	'Noen markeringer',
	'Som ny',
	'Uåpnet'
];


// Bind to DOM
window.addEventListener('load', () => {
	const elements =  document.querySelectorAll(
		"*[class~='condition-slider']"
	);

	for (const element of elements) {
		new ConditionSlider(element);
	}

});
