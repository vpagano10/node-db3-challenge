const db = require('../data/db-config');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
};

//  ✔
function find() {
    return db('schemes');
};

//  ✔
function findById(id) {
    return db('schemes')
        .where({ id })
        .first()
};

//  ✔
function findSteps(id) {
    return db('steps')
        .select('steps.id', 'schemes.scheme_name', 'step_number', 'instructions')
        .join('schemes', 'steps.scheme_id', 'schemes.id')
        .where('scheme_id', id)
};

//  ✔
function add(scheme) {
    return db('schemes')
    .insert(scheme, 'id')
    .then(ids => {
        const [ id ] = ids
        return findById(id)
    })
};

//  ✔
function update(changes, id) {
    return db('schemes')
    .where({ id })
    .update(changes, '*')
};

//  ✔
function remove(id) {
    return db('schemes')
        .where({ id })
        .del()
};


// findSteps will be created similarly to this below

/*
select
    p.id,
    p.contents as Quote,
    u.username as Author
from posts as p
join users as u
    on p.user_id = u.id
where user_id = 1;
*/

// Takes the SQLite format from above and re-writes as knex
// function findUserPosts(userId) {
//     return db('posts as p')
//         .select('p.id', 'p.contents as Quote', 'u.username as Author')
//         .join('users as u', 'p.user_id', 'u.id')
//         .where('user_id', userId)
// };