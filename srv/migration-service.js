const cds = require('@sap/cds')

module.exports = cds.service.impl(async function() {
    this.on('READ', 'StatusValues', (req) => {
        return [
            { code: 'COMPLETED' },
            { code: 'IN_PROGRESS' },
            { code: 'ON_HOLD' },
            { code: 'YET_TO_START' }
        ]
    })
})