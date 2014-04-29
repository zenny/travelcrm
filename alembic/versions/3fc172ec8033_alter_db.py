"""alter db

Revision ID: 3fc172ec8033
Revises: 37790c742951
Create Date: 2014-04-23 21:36:43.356722

"""

# revision identifiers, used by Alembic.
revision = '3fc172ec8033'
down_revision = '37790c742951'

from alembic import op
import sqlalchemy as sa


def upgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.add_column('resource', sa.Column('protected', sa.Boolean(), nullable=True))
    ### end Alembic commands ###


def downgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('resource', 'protected')
    ### end Alembic commands ###
