
import router from '@ohos.router'
@Component
export struct Header{
  private title: ResourceStr
  @State params: any = router.getParams()
  build(){
    // 标题部分
    Row({space: 5}){
      if(this.params){
        Image($r('app.media.ic_public_back'))
          .width(30)
          .onClick(() => {
            // 返回前的警告
            /* router.showAlertBeforeBackPage({
               message: '操作还未完成，确定要返回吗？'
             })*/

            // 返回上一页
            router.back()
          })
        if(this.title){
          Text(this.params.id + '.' + this.title)
            .fontSize(28)
            .fontWeight(FontWeight.Bold)
        }
        Blank()
        Image($r('app.media.ic_public_refresh'))
          .width(30)
      }

    }
    .width('98%')
    .height(30)
  }
}