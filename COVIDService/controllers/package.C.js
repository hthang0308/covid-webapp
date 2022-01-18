const packModel = require('../models/package.M');
const sort = require('../utils/sort');

//Routes
exports.getAllPackages = async (req, res) => {
    arr = await packModel.getAllPackages();
    if (req.query.sort === "name") sort.sortByName(arr);
    if (req.query.sort === "id") sort.sortByID(arr);
    if (req.query.sort === "price") sort.sortByPrice(arr);
    res.render('packages/all', {
        packages: arr
    })
}

exports.searchPackages = async (req, res) => {
    tmpPack = await packModel.searchPackageByName(req.params.name);
    res.render('packages/search', {
        package: tmpPack
    })
};

exports.getPackage = async (req, res) => {
    tmpPack = await packModel.getPackageById(req.params.id);
    if (tmpPack === undefined) return;
    res.render('packages/single', {
        package: tmpPack
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
        res.redirect('packages/package-success', {
            messages: 'Thêm gói nhu yếu phẩm thành công'
        });
    }
    res.render('packages/add');
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
        res.redirect('packages/package-success', {
            messages: 'Chỉnh sửa gói nhu yếu phẩm thành công'
        });
    }
    res.render('packages/edit', {
        package: tmpPack
    });
}

exports.deletePackage = async (req, res) => {
    await packModel.deletePackage(req.params.id);
    res.redirect('packages/package-success', {
        messages: 'Xóa gói nhu yếu phẩm thành công'
    });
}