const { DEPOSIT, WITHDRAWAL, PAYMENT } = require('../utils/constant');

exports.getName = (action) => {
    switch (action) {
        case DEPOSIT:
            return 'Nạp tiền vào tài khoản'
        // break;
        case WITHDRAWAL:
            return 'Rút tiền khỏi tài khoản'
        case PAYMENT:
            return 'Thanh toán hóa đơn'
        default:
            return 'Khác';
    }
}