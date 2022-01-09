const packModel = require('../models/package.M');
const sort = require('../utils/sort');

//Routes
exports.getAllPackages = async (req, res) => {
    arr = await packModel.getAllPackages();
    if (req.query.sort === "name") sort.sortByName(arr);
    if (req.query.sort === "id") sort.sortByID(arr);
    if (req.query.sort === "price") sort.sortByPrice(arr);
    res.render('/all', {
        products: arr
    })
}

exports.searchPackages = async (req, res) => {
    tmpPack = await packModel.searchPackageByName(req.params.name);
    res.render('/search', {
        product: tmpPack
    })
};

exports.createPackage = async (req, res) => {
    if (req.method === "POST") {
        const _package = { ...req.body }
        _package.products =
            _package.products.split(',')
                .filter(product => product !== '')
                .map(product => {
                    return {
                        necessary_id: product.split('-')[0],
                        max_per_package: product.split('-')[1]
                    }
                });

        await packModel.addPackage(_package);
        res.redirect('/package-success');
    }
    res.render('form_addPackage');
}

exports.editPackage = async (req, res) => {
    tmpPack = await packModel.getPackageById(req.params.id);
    if (req.method === "PATCH") {
        const _package = { ...req.body };
        _package.products =
            _package.products.split(',')
                .filter(product => product !== '')
                .map(product => {
                    return {
                        necessary_id: product.split('-')[0],
                        max_per_package: product.split('-')[1]
                    }
                });

        await packModel.editPackage(req.params.id, _package);
        res.redirect('/package-success');
    }
    res.render('/single', {
        pack: tmpPack
    });
}

exports.deletePackage = async (req, res) => {
    await packModel.deletePackage(req.params.id);
    res.redirect('/home');
}