const admin = require('firebase-admin');
const _ = require('lodash');
var serviceAccount = null;

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

const storageWeb = admin.storage.bucket();

const uploadSingle = async (file) => {
    try {
        const storage = await storageWeb.upload(file.path, {
            public: true,
            destination: `uploads/${file.filename}`,
            metadata: {
                firebaseStorageDownloadTokens: _.uniqueId(file),
            }
        });
        return storage[0].metadata.mediaLink;
    } catch (error) {
        throw error;
    }
}

const uploadFiles = async (files) => {
    try {
        let urls = []
        for (const file of files) {
            const url = await uploadSingle(file);
            urls.push(url);
        }
        return urls;
    } catch (error) {
        throw error
    }
}

const deleteFile = async (urlFile) => {
    const name_idx = urlFile.indexOf('images');
    const ext_idx = urlFile.indexOf('.', name_idx);
    const end_idx = urlFile.indexOf('?', ext_idx);
    let path = '/uploads/';
    path += urlFile.slice(name_idx, end_idx);
    try {
        await storageWeb.file(path).delete()
    } catch (error) {
        console.log('Error: ', error);
    }
}

const fbService = {
    uploadFiles, uploadSingle, deleteFile,
}

module.exports = fbService;