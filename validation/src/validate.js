const Ajv = require('ajv');
const fs = require('fs');

const ajv = new Ajv();
const query = JSON.parse(fs.readFileSync(0, "utf-8"))
const schema = JSON.parse(query.schema)
const value = JSON.parse(query.value)

const valid = ajv.validate(schema, value)
if(!valid) {
    console.error(ajv.errors)
    process.exitCode = 1
}
console.log("{}")
