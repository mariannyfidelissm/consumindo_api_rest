require('dotenv').config()

module.exports = {
    // Development
    development: {
      client: 'sqlite3',
      connection: {
        filename: `${__dirname}/db/dev.sqlite3`
      },
      migrations: {
        tableName: 'knex_migrations',
        directory: `${__dirname}/src/database/migrations`
      },
      seeds: {
        tableName: 'knex_migrations',
        directory: `${__dirname}/src/database/seeds`
      },
      useNullAsDefault: true,
      uuid: `(lower(hex(randomblob(4))) || '-' || lower(hex(randomblob(2))) || '-4' || substr(lower(hex(randomblob(2))),2) || '-' || substr('89ab',abs(random()) % 4 + 1, 1) || substr(lower(hex(randomblob(2))),2) || '-' || lower(hex(randomblob(6))))`
    },
}
  