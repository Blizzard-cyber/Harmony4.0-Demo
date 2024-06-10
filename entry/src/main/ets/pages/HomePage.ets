import RouterInfo from '../viewmodel/RouterInfo'
import IndexFontSizePanel from '../views/IndexFontSizePanel'
import RouterItem from '../views/RouterItem'
import PreferencesUtil from '../common/util/PreferencesUtil'

const routers: RouterInfo[] = [
  new RouterInfo('pages/ImagePage', '图片查看'),
  new RouterInfo('pages/ItemPage', '商品列表'),
  new RouterInfo('pages/StatePage', '学生列表'),
  new RouterInfo('pages/PropPage', '任务列表'),
]

@Entry
@Component
export default struct homePage {
  @State message: string = '页面列表'
  @State showPanel: boolean = false
  @Provide fontSize: number = 16

  async aboutToAppear(){
    this.fontSize = await PreferencesUtil.getPreferenceValue('MyPreferences', 'IndexFontSize', 16) as number
  }

  build() {
    Column() {
      // 顶部标题
      this.Title()

      // 导航列表
      this.RouterList()

      // 字体修改面板
      if(this.showPanel){
        IndexFontSizePanel()
          .transition({
            translate: { y: 115 }
          })
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  Title() {
    Row() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .height(80)
      Image($r('app.media.ic_public_settings'))
        .width(30)
        .onClick(() => {
          animateTo({ duration: 500, curve: Curve.EaseOut }, () => this.showPanel = !this.showPanel)
        })
    }
    .justifyContent(FlexAlign.SpaceAround)
    .width('100%')
    .margin({top:15,bottom:10})
  }


  @Builder
  RouterList() {
    List({ space: 35 }) {
      ForEach(
        routers,
        (router, index) => {
          ListItem() {
            RouterItem({ r: router, i: index + 1 })
          }
        }
      )
    }
    .layoutWeight(1)
    .alignListItem(ListItemAlign.Center)
    .width('100%')
  }


}