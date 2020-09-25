from urllib import request #urlを取得する
from bs4 import BeautifulSoup #HTMLのデータの中身を切り貼り出来る
import csv #CSVファイルの生成
import numpy as np #配列計算を高速化
import time #時間を取得高速化

class csvwrite(): #csvwriteクラス
    def header(): #ヘッダーのインスタンスメソッド作成
        header = ['company','tel','address','url','url2','mail','title','indestry','first_name','name_kana','time','year']
        with open('laywercom.csv',mode ='a', encoding='UTF-8') as fp : #'a'は存在しない場合に新規作成される
            csv_writer=csv.writer(fp,lineterminator='\n') #lineterminator='\n'は改行コードを指定
            csv_writer.writerow(header)
    def datas(datas):
        with open('laywercom.csv',mode ='a', encoding='UTF-8') as fp :
            csv_writer=csv.writer(fp,lineterminator='\n')
            csv_writer.writerows(datas)

top = 'https://www.bengo4.com'
url = 'https://www.bengo4.com/search/result/#csrf=VkJUa1F4dDNYYTJubGpjZUIxeXByd3VYaTdkbXYwWE8dXBvBWtEHQZDDp0xqlfk0tWxmr0PGm0yxIQ88tSqCmg&page=1'
#北海道　青森　宮城
def f_0(url):
    global datas #global変数の宣言
    html = request.urlopen(url)
    print(url)
    soup = BeautifulSoup(html, 'html.parser')
    next_page_tag = soup.find_all('a',{'class','btn_next'})
    next_page = ''
    if next_page_tag == []: # 次ページが無い場合
        pass
    else: # 次ページがある場合
        for tags in next_page_tag:
                next =  tags.get('href')
                next_page = top + next

    Index_all = soup.find_all('a',{"class","profile__base uaLbl_111"})
    datas=[] #データの格納変数を定義
    if Index_all == []:
        url_1 = ''
    else:
      for index in Index_all: #index_allをループで回す
        url_1 = index.get('href') #a hrefを抜き出す★修正分
        print(' ∟ ',url_1) # ★追加分
        #rou[5] = top + url_1
        f_1(url_1)
    csvwrite.datas(datas) #datasへ書き込み
    return next_page

def f_1(url):
    global datas
    html = request.urlopen(url)
    soup = BeautifulSoup(html, 'html.parser')
    row = ['','','','','','','','','','','','','','','','']
    if(soup.find('p',{"class","profHead__data__office"}) != -1 and
       soup.find('p',{"class","profHead__data__office"}) is not None):
       company = soup.find('p',{"class","profHead__data__office"})
       row[0] = company.get_text().replace('\n','').replace('\r','').replace(' ','').replace('\t','')
    address = soup.find('address',{"class","profHead__data__address"})
    row[2] = address.get_text().replace('\n','').replace('\r','').replace(' ','').replace('\t','')
    first_name = soup.find('h1',{"class","profHead__nameWrap"})
    row[8] = first_name.get_text().replace('\n','').replace('\r','').replace(' ','').replace('\t','')
    dl = soup.find_all('dl',{"class","table_style clearfix"})
    for tab in dl:
        th_tds = tab.find_all(["dt","dd"])
        for x in range(len(th_tds)):
            s0 = th_tds[x].get_text().replace('\n','').replace('\r','').replace(' ','').replace('\t','')
            if s0 == '所属弁護士会':
                row[10] = th_tds[x+1].get_text().replace('\n','').replace('\r','').replace(' ','').replace('\t','')
            elif s0 == '弁護士登録年':
                row[11] = th_tds[x+1].get_text().replace('\n','').replace('\r','').replace(' ','').replace('\t','')

    row[7] = "弁護士ドットコム"

    datas.append(row)

csvwrite.header()
next_page = url #+ '&page=1' # 1ページ目を初期設定
while next_page != '':
    next_page = f_0(next_page)
print('完了')
