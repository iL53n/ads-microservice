class CreateAdService
  prepend BasicService

  option :ad do
    option :title
    option :description
    option :city
  end

  option :user

  attr_reader :ad

  def call
    @ad = ::Ad.new(@ad.to_h)
    @ad.user = @user

    # @ad = @user.ads.new(@ad.to_h)
    fail!(@ad.errors) unless @ad.save
  end
end
