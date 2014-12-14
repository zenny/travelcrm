"""alter db

Revision ID: 339f51c3cba9
Revises: 43168ad6ab56
Create Date: 2014-12-14 18:23:54.865890

"""

# revision identifiers, used by Alembic.
revision = '339f51c3cba9'
down_revision = '43168ad6ab56'

from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import postgresql

def upgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.create_table('notification',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('resource_id', sa.Integer(), nullable=False),
    sa.Column('title', sa.String(), nullable=False),
    sa.Column('descr', sa.String(), nullable=False),
    sa.Column('url', sa.String(), nullable=True),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.ForeignKeyConstraint(['resource_id'], ['resource.id'], name='fk_resource_id_notification', onupdate='cascade', ondelete='restrict'),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('employee_notification',
    sa.Column('employee_id', sa.Integer(), nullable=False),
    sa.Column('notification_id', sa.Integer(), nullable=False),
    sa.ForeignKeyConstraint(['employee_id'], ['employee.id'], name='fk_employee_id_employee_notification', onupdate='cascade', ondelete='restrict'),
    sa.ForeignKeyConstraint(['notification_id'], ['notification.id'], name='fk_contact_id_employee_notification', onupdate='cascade', ondelete='restrict'),
    sa.PrimaryKeyConstraint('employee_id', 'notification_id')
    )
    op.drop_table('apscheduler_jobs')
    ### end Alembic commands ###


def downgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.create_table('apscheduler_jobs',
    sa.Column('id', sa.VARCHAR(length=191), autoincrement=False, nullable=False),
    sa.Column('next_run_time', postgresql.DOUBLE_PRECISION(precision=53), autoincrement=False, nullable=True),
    sa.Column('job_state', postgresql.BYTEA(), autoincrement=False, nullable=False),
    sa.PrimaryKeyConstraint('id', name=u'apscheduler_jobs_pkey')
    )
    op.drop_table('employee_notification')
    op.drop_table('notification')
    ### end Alembic commands ###