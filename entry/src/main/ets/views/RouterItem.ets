
import router from '@ohos.router'
import RouterInfo from '../viewmodel/RouterInfo'

@Component
export default struct RouterItem{
  r: RouterInfo
  i: number
  @Consume fontSize: number

  build(){
    Row(){
      Text(this.i + '.')
        .fontSize(this.fontSize)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
      Blank()
      Text(this.r.title)
        .fontSize(this.fontSize)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
    }
    .width('80%')
    .padding(12)
    .backgroundColor('#36D')
    .borderRadius(20)
    .shadow({radius: 6, color: '#4F000000', offsetX: 2, offsetY: 4})
    .onClick(() => {
      // router跳转
      router.pushUrl(
        {
          url: this.r.url,
          params: {id: this.i}
        },
        router.RouterMode.Single,
        err => {
          if(err){
            console.log(`路由失败，errCode: ${err.code} errMsg:${err.message}`)
          }
        }
      )
    })
  }
}