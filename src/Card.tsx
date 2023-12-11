export const Card = () => {
    const changeLng = () => {
        document.title = "change lng"
    }
    return (
<div>
            <button onClick={changeLng}>Test</button>
        </div>
    )
}