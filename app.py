import streamlit as st
import datetime
import time

st.set_page_config(
    page_title="مدير الأعمال الذكي",
    page_icon="🎬",
    layout="centered"
)

st.markdown("<h2 style='text-align: center; color: #1E88E5;'>🎬 تطبيق مدير الأعمال الذكي</h2>", unsafe_allow_html=True)
st.markdown("<h5 style='text-align: center; color: #555;'>تصميم وإعداد: عزت السراء</h5>", unsafe_allow_html=True)
st.divider()

st.subheader("📁 رفع الفيديو والمعلومات")
video_file = st.file_uploader("اختر ملف الفيديو من هاتفك", type=["mp4", "mov", "avi"])
video_title = st.text_input("عنوان الفيديو")
video_description = st.text_area("وصف الفيديو (هاشتاغات وتفاصيل)")

st.divider()

st.subheader("🌐 اختر منصات النشر")
col1, col2, col3 = st.columns(3)
with col1:
    publish_yt = st.checkbox("يوتيوب")
with col2:
    publish_tt = st.checkbox("تيك توك")
with col3:
    publish_fb = st.checkbox("فيسبوك")

st.divider()

st.subheader("⏰ تحديد وقت النشر الأنسب")
auto_peak = st.checkbox("استخدام أوقات الذروة التلقائية (6:00 مساءً - 9:00 مساءً)", value=True)

if auto_peak:
    st.info("💡 سيتم جدولة الفيديو تلقائياً للنشر في وقت الذروة لضمان أعلى مشاهدات وتفاعل.")
    target_time = datetime.time(18, 0)
else:
    target_date = st.date_input("تاريخ النشر", datetime.date.today())
    target_time = st.time_input("ساعة النشر", datetime.time(18, 0))

st.divider()

if st.button("🚀 جدولة ونشر الفيديو الآن", use_container_width=True):
    if not video_file or not video_title:
        st.error("يرجى اختيار ملف فيديو وكتابة العنوان أولاً.")
    elif not (publish_yt or publish_tt or publish_fb):
        st.warning("يرجى اختيار منصة واحدة على الأقل للنشر.")
    else:
        st.success("تم استلام الطلب وبدء الجدولة!")
        progress_bar = st.progress(0)
        for percent_complete in range(100):
            time.sleep(0.02)
            progress_bar.progress(percent_complete + 1)
        st.balloons()
        st.success(f"تمت جدولة الفيديو '{video_title}' بنجاح للنشر في وقت الذروة ({target_time.strftime('%I:%M %p')}).")
      
