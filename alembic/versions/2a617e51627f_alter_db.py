"""alter db

Revision ID: 2a617e51627f
Revises: 14346fefb145
Create Date: 2014-10-25 15:59:34.319455

"""

# revision identifiers, used by Alembic.
revision = '2a617e51627f'
down_revision = '14346fefb145'

from alembic import op
import sqlalchemy as sa


def upgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('tour_sale', 'currency_id')
    op.drop_column('tour_sale', 'touroperator_id')
    op.drop_column('tour_sale', 'price')
    op.drop_column('tour_sale', 'base_price')
    op.drop_column('tour_sale', 'service_id')
    ### end Alembic commands ###


def downgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.add_column('tour_sale', sa.Column('service_id', sa.INTEGER(), nullable=False))
    op.add_column('tour_sale', sa.Column('base_price', sa.NUMERIC(precision=16, scale=2), nullable=False))
    op.add_column('tour_sale', sa.Column('price', sa.NUMERIC(precision=16, scale=4), nullable=False))
    op.add_column('tour_sale', sa.Column('touroperator_id', sa.INTEGER(), nullable=False))
    op.add_column('tour_sale', sa.Column('currency_id', sa.INTEGER(), nullable=False))
    ### end Alembic commands ###