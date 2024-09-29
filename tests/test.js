import {osLocale} from 'os-locale';

console.log(await osLocale());
//=> 'en-US'

function normalise(input) {
	return input.replace(/_/, '-');
}

function getLocale(string) {
	return (string && string.replace(/[.:].*/, ''));
}
let r = getLocale(process.env.LANG)
console.log(r);

// console.log(normalise());

