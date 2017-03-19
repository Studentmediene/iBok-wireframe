/**
 * Singleton. Keeps track of and mounts components.
 */
const Component = {

	constructors: {},
	
	/**
	 * Registers a component.
	 *
	 * The component will be automatically mounted on load.
	 */
	register(name, Constructor) {
		if (this.constructors[name]) {
			throw new Error(`"${name}" is already registered`);
		}

		this.constructors[name] = Constructor;
	},

	/**
	 * Mounts the given component on elements matching the pattern in the
	 * subtree defined by the given element.
	 */
	mount(name, element) {
		const Constructor = this.constructors[name];
		const elements = element.querySelectorAll(
			`*[class~='${name}']`
		);

		console.log(`Mounting ${elements.length} ${name} components`);

		for (const element of elements) {
			new Constructor(element);
		}
	},

	mountAll(element) {
		for (const name in this.constructors) {
			this.mount(name, element);
		}
	}
};

window.addEventListener('load', () => {
	Component.mountAll(document);
});
