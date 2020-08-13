const db = require('../data/db-config')

module.exports = {
    find,
    findById,
    add,
    update,
    remove,
    findSteps
}

function find() {
    return db('schemes')
}

function findById(id) {
   return db('schemes')
   .where({ id })
   .first()

}

function add(data) {
    return db('schemes')
    .insert(data)

}

function update(changes, id) {
    return db("schemes")
    .where({id})
    .update(changes)
    .then(() => {
        return findById(id);
    });
}

function remove(id){
    return db('schemes')
    .where({id})
    .del()
}

function findSteps(id){
    return db('steps')
    .where('steps.scheme_id', id)
    .join('schemes', 'schemes.id', 'steps.scheme_id')
    .select('steps.step_number', 'schemes.scheme_name', 'steps.instructions')
    .orderBy("steps.step_number")
    
}