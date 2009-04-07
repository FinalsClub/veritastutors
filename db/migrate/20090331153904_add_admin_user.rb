class AddAdminUser < ActiveRecord::Migration
  def self.up
    u = User.new( { :login => 'admin', :email => 'admin_foo@bar.org', :password => 'donkeybutter', :password_confirmation => 'donkeybutter' } )
    u.roles = [ Role[:admin] ]
    u.save
  end

  def self.down
    u = User.find_by_login( 'admin' )
    if(u)
      u.delete
    end
  end
end
