"""alter db

Revision ID: 47b758cd2959
Revises: 18edfb87777e
Create Date: 2014-10-04 11:37:37.384255

"""

# revision identifiers, used by Alembic.
revision = '47b758cd2959'
down_revision = '18edfb87777e'

from alembic import op
import sqlalchemy as sa


def upgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('structure_account')
    ### end Alembic commands ###


def downgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.create_table('structure_account',
    sa.Column('structure_id', sa.INTEGER(), autoincrement=False, nullable=False),
    sa.Column('account_id', sa.INTEGER(), autoincrement=False, nullable=False),
    sa.ForeignKeyConstraint(['account_id'], [u'account.id'], name=u'fk_account_id_structure_account', onupdate=u'CASCADE', ondelete=u'RESTRICT'),
    sa.ForeignKeyConstraint(['structure_id'], [u'structure.id'], name=u'fk_structure_id_structure_account', onupdate=u'CASCADE', ondelete=u'RESTRICT'),
    sa.PrimaryKeyConstraint('structure_id', 'account_id', name=u'structure_account_pkey')
    )
    ### end Alembic commands ###