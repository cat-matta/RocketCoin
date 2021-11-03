from datetime import datetime
from flask import Flask, request, flash, url_for, redirect, \
     render_template, abort
from flask_sqlalchemy import SQLAlchemy
import sqlalchemy.orm
from cockroachdb.sqlalchemy import run_transaction


app = Flask(__name__)
app.config.from_pyfile('hello.cfg')
db = SQLAlchemy(app)
sessionmaker = sqlalchemy.orm.sessionmaker(db.engine)


class Transaction(db.Model):
    __tablename__ = 'transactions'
    id = db.Column('transaction_id', db.Integer, primary_key=True)
    value = db.Column(db.Float)
    text = db.Column(db.String)
    category = db.Column(db.String)
    pub_date = db.Column(db.DateTime)

    def __init__(self, value, text, category=None):
        self.value = value
        self.text = text
        self.category = category
        self.pub_date = datetime.utcnow()


@app.route('/')
def show_all():
    def callback(session):
        return render_template(
            'show_all.html',
            todos=session.query(Transaction).order_by(Transaction.pub_date.desc()).all())
    return run_transaction(sessionmaker, callback)


@app.route('/new', methods=['GET', 'POST'])
def new():
    if request.method == 'POST':
        if not request.form['value']:
            flash('Value is required', 'error')
        elif not request.form['text']:
            flash('Text is required', 'error')
        else:
            def callback(session):
                transaction = Transaction(request.form['title'], request.form['text'])
                session.add(Transaction)
            run_transaction(sessionmaker, callback)
            flash(u'Transaction was successfully created')
            return redirect(url_for('show_all'))
    return render_template('new.html')


@app.route('/update', methods=['POST'])
def update_done():
    def callback(session):
        for transaction in session.query(Transaction).all():
            todo.done = ('done.%d' % transaction.id) in request.form
    run_transaction(sessionmaker, callback)
    flash('Updated status')
    return redirect(url_for('show_all'))


if __name__ == '__main__':
    app.run()