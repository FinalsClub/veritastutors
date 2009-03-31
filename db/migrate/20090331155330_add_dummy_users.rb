class AddDummyUsers < ActiveRecord::Migration
  def self.up

    u = User.new( { :login => 'tutor1', :email => 'tutor_one@bar.org', :password => 'donkeybutter', :password_confirmation => 'donkeybutter' } )
    u.roles = [Role::Tutor]
    u.save

    t = Tutor.new
    t.user_id = u.id
    t.save

    u = User.new( { :login => 'tutor2', :email => 'tutor_two@bar.org', :password => 'donkeybutter', :password_confirmation => 'donkeybutter' } )
    u.roles = [Role::Tutor]
    u.save

    t = Tutor.new
    t.user_id = u.id
    t.save

  end

  def self.down

    u = User.find_by_login('tutor1')
    t = Tutor.find_by_user_id(u.id)
    if(u)
      u.delete
    end
    if(t)
      t.delete
    end

    u = User.find_by_login('tutor2')
    t = Tutor.find_by_user_id(u.id)
    if(u)
      u.delete
    end
    if(t)
      t.delete
    end


    

  end
end
