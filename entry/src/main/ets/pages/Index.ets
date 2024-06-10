
import ImagePage from './ImagePage'
import ItemPage from './ItemPage'
import PropPage from './PropPage'
import StatePage from './StatePage'
import homePage from './HomePage'

@Entry
@Component
struct Index {
  @Builder
  tabBuilder(title:string,img:ResourceStr){
    Column(){
      Image(img)
        .width(30)
      Text(title)
    }

  }


  build() {
    Tabs({barPosition:BarPosition.End,index:2}){
      TabContent(){
        ImagePage()
      }
      .tabBar(this.tabBuilder('图片', $r('app.media.ic_gallery_create')))

      TabContent(){
        ItemPage()
      }
      .tabBar(this.tabBuilder('商品', $r('app.media.ic_gallery_discover')))

      TabContent() {
        homePage()
      }
      .tabBar(this.tabBuilder('主页', $r('app.media.ic_public_home')))

      TabContent(){
        PropPage()
      }
      .tabBar(this.tabBuilder('学生', $r('app.media.ic_public_contacts')))

      TabContent(){
        StatePage()
      }
      .tabBar(this.tabBuilder('任务', $r('app.media.ic_public_drawer')))


    }
    .scrollable(false)
    .animationDuration(0)
  }
}