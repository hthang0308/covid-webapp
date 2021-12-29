const productModel = require('../models/productModel');

const sortByName = (array) => {
    array.sort(function (a, b) {
        return a.f_Name.localeCompare(b.f_Name);
    })
}

const sortById = (array) => {
    array.sort(function (a, b) {
        return a.f_ID - b.f_ID;
    })
}

const sortByPrice = (array) => {
    array.sort(function (a, b) {
        return a.f_Price - b.f_Price;
    })
}

exports.sortProduct = async (req, res) => {
    arr = await productModel.getAllProducts();
    if (req.query.sort === "name") sortByName(arr);
    if (req.query.sort === "id") sortById(arr);
    if (req.query.sort === "price") sortByPrice(arr);
    res.render('/all', {
        products: arr
    });
}

exports.searchProduct = async (req, res) => {
    tmpProd = await productModel.searchProductByName(req.params.name);
    res.render('/all', {
        products: tmpProd
    });
}

exports.createProduct = async (req, res) => {
    if (req.method === "POST") {
        productModel.addProduct(req.body);
        res.redirect('./');
    }
    res.render('form_addProduct');
}

exports.editProduct = async (req, res) => {
    tmpProd = await productModel.getProductById(req.params.id);
    res.render('/single', {
        product: tmpProd
    });
}

exports.deleteProduct = async (req, res) => {
    res.render('/single');
}