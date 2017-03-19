/**
 * Extracts a parameter from the URL and places it in a form field
 */
function ParamValue(element) {
	const name = element.getAttribute('data-param-name');

	if (!name) {
		throw new Error('No parameter set');
	}

	console.log('constructing');

	const params = window
		.location
		.search
		.substr(1)
		.split('&')
		.map((p) => p.split('='))
		.reduce((acc, cur) => {
			acc[cur[0]] = cur[1];
			return acc;
		}, {});

	element.innerHTML = decodeURIComponent(params[name]);
}

Component.register('param-value', ParamValue);
