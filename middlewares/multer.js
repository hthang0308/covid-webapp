const multer = require('multer');

const storage = multer.diskStorage({
    filename: function (req, file, cb) {
        const extArray = file.mimetype.split('/');
        const ext = extArray[extArray.length - 1];
        cb(null, file.fieldname + '-' + Date.now() + '.' + ext);
    }
})

var uploads = multer({ storage: storage });
module.exports = uploads;