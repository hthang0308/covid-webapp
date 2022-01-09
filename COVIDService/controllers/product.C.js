const productModel = require('../models/product.M');
const sort = require('../utils/sort');
const { uploadFiles } = require('../middlewares/firebase');

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

exports.getProduct = async (req, res) => {
    tmpProd = await productModel.getProductById(req.params.id);
    res.render('/single', {
        products: tmpProd
    })
}

exports.createProduct = async (req, res) => {
    if (req.method === "POST") {
        const files = await uploadFiles(req.files);
        const product = { ...req.body, images: files };
        await productModel.createProduct(product);
        res.redirect('form_addProductSuccess');
    }
    res.render('form_addProduct');
}

exports.editProduct = async (req, res) => {
    tmpProd = await productModel.getProductById(req.params.id);
    if (req.method === "PATCH") {
        const files = await uploadFiles(req.files);
        const product = { ...req.body, images: files };
        await productModel.editProduct(req.params.id, product);
        res.redirect('form_editSuccess');
    }
    res.render('/single', {
        product: tmpProd
    });
}

exports.deleteProduct = async (req, res) => {
    await productModel.deleteProduct(req.params.id);
    res.redirect('home');
}