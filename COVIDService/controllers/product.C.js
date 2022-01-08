const productModel = require('../models/product.M');
const sort = require('../utils/sort');

// Route
exports.getAllProducts = async (req, res) => {
    arr = await productModel.getAllProducts();
    if (req.query.sort === "name") sort.sortByName(arr);
    if (req.query.sort === "id") sort.sortByID(arr);
    if (req.query.sort === "price") sort.sortByPrice(arr);
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