const locationModel = require('../models/location.M');

exports.getLocationsById = async (req, res) => {
    const result = await locationModel.getLocationById(req.params.id);
    const data = result.data;
    res.render(data);
}