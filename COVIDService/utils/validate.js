//Utils Function
const isValidName = (name) => {
    if (!name) return false;
    let firstLetters = name.split(/\s/).reduce((response, word) => (response += word.slice(0, 1)), "");
    for (const letter of firstLetters) if (letter != letter.toUpperCase()) return false;
    return true;
};
const isValidFx = (x) => {
    return x >= 0 && x <= 3;
};
const isNumber = (str) => {
    return /^\d+$/.test(str);
};

module.exports = { isValidName, isValidFx, isNumber };