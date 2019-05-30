class LinksController < ApplicationController
  before_action :set_link, only: [:edit, :update, :destroy]
  before_action :set_category_columns, only: [:new, :edit]
# no index method needed

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
    @categories = Category.all.where(:user => current_user)
    @categories = @categories.order(:name)
  end

  def create
    @link = Link.new(link_params)
    @link.save
    redirect_to categories_path
  end

  def edit
    @categories = Category.all.where(:user => current_user)
    @categories = @categories.order(:name)
  end

  def update
    @link.update(link_params)
    redirect_to root_path
  end

  def destroy
    # @category = @link.category
    @link.destroy
    redirect_to root_path
    # raise
  end

  def default_links
    # 9 categories total
    @category = Category.last.id
    links_attributes = [
      {
        name: "zkillboard",
        url: "https://zkillboard.com/",
        category_id: @category + 1 - 8
      },
      {
        name: "Thera Map",
        url: "https://www.eve-scout.com/thera/map/",
        category_id: @category + 2 - 8
      },
      {
        name: "10/10 Hilarious Tengu Guide Video",
        url: "https://www.youtube.com/watch?v=1yOcts5GJ3I&t=46s",
        category_id: @category + 3 - 8
      },
      {
        name: "Eve Market Data",
        url: "https://eve-marketdata.com/",
        category_id: @category + 5 - 8
      },
      {
        name: "Combat Sites (Eve Wiki)",
        url: "https://wiki.eveuniversity.org/Combat_sites",
        category_id: @category + 3 - 8
      },
      {
        name: "Tips and Tricks (Eve Wiki)",
        url: "https://wiki.eveuniversity.org/Tips_and_Tricks",
        category_id: @category + 6 - 8
      },
      {
        name: "NPC Damage Types",
        url: "https://wiki.eveuniversity.org/NPC_Damage_Types",
        category_id: @category + 3 - 8
      },
      {
        name: "Standard Sleeper Cache in an Astero",
        url: "https://www.reddit.com/r/Eve/comments/3o1q1m/standard_sleeper_cache_guide_in_an_astero/?depth=1",
        category_id: @category + 7 - 8
      },
      {
        name: "Superior Sleeper Cache in a Frigate",
        url: "https://www.youtube.com/watch?v=HvxZAQ51P8Q",
        category_id: @category + 7 - 8
      },
      {
        name: "T3 Cruisers Subsystem Tool",
        url: "http://www.ellahta.com/eve/T3.asp",
        category_id: @category + 4 - 8
      },
      {
        name: "Wormhole Attributes",
        url: "https://wiki.eveuniversity.org/Wormhole_Information",
        category_id: @category + 8 - 8
      },
      {
        name: "P.I. Tool",
        url: "https://hanns.io/pi/",
        category_id: @category + 5 - 8
      },
      {
        name: "Eve Gatecamp Check",
        url: "http://eve-gatecheck.space/eve/",
        category_id: @category + 2 - 8
      },
      {
        name: "WH Combat Site Info",
        url: "https://docs.google.com/spreadsheets/d/17cNu8hxqJKqkkPnhDlIuJY-IT6ps7kTNCd3BEz0Bvqs/pubhtml#",
        category_id: @category + 8 - 8
      },
      {
        name: "Booster Production Guide",
        url: "https://eve-files.com/media/corp/jowen/ATAP_booster_production_v1.2.pdf",
        category_id: @category + 5 - 8
      },
      {
        name: "Living Solo in a Wormhole",
        url: "https://www.youtube.com/watch?v=nIGpQrz5l1Y",
        category_id: @category + 7 - 8
      },
      {
        name: "T2 Invention Guide",
        url: "http://nevillesmit.com/blog/2013/5/24/tech-ii-invention-guide",
        category_id: @category + 5 - 8
      },
      {
        name: "LP Store Guide",
        url: "https://www.fuzzwork.co.uk/lpstore",
        category_id: @category + 6 - 8
      },
      {
        name: "Boosters Guide",
        url: "https://wiki.eveuniversity.org/Medical_boosters",
        category_id: @category + 6 - 8
      },
      {
        name: "LP Rewards",
        url: "http://www.ellatha.com/eve/news/516/Loyalty-Points-DB-Update---Militia-Corps-Added",
        category_id: @category + 6 - 8
      },
      {
        name: "Gas ISK/m3 Guide",
        url: "https://www.fuzzwork.co.uk/ore/gas.html",
        category_id: @category + 3 - 8
      },
      {
        name: "Eve Survival",
        url: "https://eve-survival.org/wikka.php?wakka=HomePage",
        category_id: @category + 3 - 8
      },
      {
        name: "WH Classification Guide",
        url: "http://anoik.is/wormholes",
        category_id: @category + 8 - 8
      },
      {
        name: "Abyssal Filament Cheat Sheet",
        url: "https://imgur.com/a/unnuE0T",
        category_id: @category + 3 - 8
      },
      {
        name: "n00b FC Guide",
        url: "https://docs.google.com/document/d/1uQgqZioGx-dAfA6spswU3_Tr_puvuzUU7NGZEr1UV4Y/edit",
        category_id: @category + 4 - 8
      },
      {
        name: "BC Torpedo Fit BS PvP Video",
        url: "https://www.youtube.com/watch?v=q51vswj18f0",
        category_id: @category + 4 - 8
      },
      {
        name: "Bombers Bar HomePage",
        url: "http://www.bombersbar.org/",
        category_id: @category + 4 - 8
      },
      {
        name: "Eve Overmind - PvP Simulator",
        url: "https://www.eveovermind.com/solokills.php",
        category_id: @category + 4 - 8
      },
      {
        name: "DED Sites Guide",
        url: "http://wiki.eve-inspiracy.com/index.php?title=DED_Complex_List",
        category_id: @category + 3 - 8
      },
      {
        name: "Solo Camping with a Sabre",
        url: "http://failheap-challenge.com/showthread.php?16825-TMA-Life-Inside-the-Bubble-How-to-solo-camp-with-a-Sabre",
        category_id: @category + 4 - 8
      },
      {
        name: "DED Sites Guide",
        url: "https://www.fuzzwork.co.uk/evelopedia/index.php/DED_Complex_List",
        category_id: @category + 3 - 8
      },
      {
        name: "T3Cs in DED Sites After Changes",
        url: "https://forums.eveonline.com/t/combat-and-ded-sites-fits-for-t3c-after-changes/9615/29",
        category_id: @category + 3 - 8
      },
      {
        name: "Cloaky Bastard Blog - A solo WH Hunter",
        url: "http://cloakybastard.blogspot.com/",
        category_id: @category + 4 - 8
      },
      {
        name: "Tengu 10/10 Serpentis",
        url: "https://www.reddit.com/r/fittings/comments/7w6cus/r_tengu_for_serpentis_1010/?depth=1",
        category_id: @category + 3 - 8
      },
      {
        name: "Loki 10/10 Sansha",
        url: "https://www.reddit.com/r/fittings/comments/6ppsvd/f_loki_1010_sansha/?depth=1",
        category_id: @category + 3 - 8
      },
      {
        name: "Eve Turrets Ammo Full Guide",
        url: "https://imgur.com/a/KSxbcAJ#XGPoocQ",
        category_id: @category + 1 - 8
      },
      {
        name: "Abyssal NPC Effects Guids",
        url: "https://i.imgur.com/wnA9Ou5.jpg",
        category_id: @category + 3 - 8
      },
      {
        name: "Abyssal Sites Guide",
        url: "https://forums.eveonline.com/t/garrys-great-abyssal-guide-solved-ships-fits-to-run-l5-abyssal-sites/80214",
        category_id: @category + 3 - 8
      },
      {
        name: "Dotlan",
        url: "http://evemaps.dotlan.net/",
        category_id: @category + 1 - 8
      },
      {
        name: "Dotlan Routes",
        url: "http://evemaps.dotlan.net/route",
        category_id: @category + 2 - 8
      },
      {
        name: "Eve Info: News Resources",
        url: "https://eveinfo.com/",
        category_id: @category + 6 - 8
      },
      {
        name: "OC Tripwire Map",
        url: "https://tripwire.eve-apps.com/?system=J163923",
        category_id: @category + 1 - 8
      },
      {
        name: "Local Threat",
        url: "https://localthreat.xyz/",
        category_id: @category + 1 - 8
      }
    ]

# categories_attributes.each { |params| Category.create!(params) }
    links_attributes.each { |params| Link.create!(params) }
    redirect_to root_path
  end


  private

  def link_params
    params.require(:link).permit(:name, :url, :category_id)
  end

  def set_link
    @link = Link.find(params[:id])
  end

  def set_category_columns
    @categories = Category.all
    count = @categories.count
    if count / 8 == 0
      @category_columns_count = 1
    else
      @category_columns_count = count / 8 + 1
    end
  end

end
